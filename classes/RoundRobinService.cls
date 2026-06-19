public with sharing class RoundRobinService {

    public static void assignLeads(List<Lead> leads) {
        if (leads == null || leads.isEmpty()) {
            return;
        }

        Round_Robin_Config__c config = getActiveConfig();
        if (config == null) {
            return;
        }

        List<Round_Robin_Member__c> members = getAvailableMembers(config.Id);
        if (members.isEmpty()) {
            assignToFallback(leads, config);
            return;
        }

        List<Lead> leadsToUpdate = new List<Lead>();
        List<Round_Robin_Member__c> membersToUpdate = new List<Round_Robin_Member__c>();
        Integer memberIndex = 0;
        DateTime now = DateTime.now();

        for (Lead ld : leads) {
            Round_Robin_Member__c member = members.get(memberIndex);

            leadsToUpdate.add(new Lead(
                Id = ld.Id,
                OwnerId = member.User__c,
                Round_Robin_Assigned__c = true,
                Round_Robin_Assigned_Date__c = now
            ));

            member.Last_Assigned_Date__c = now;
            member.Assignment_Count__c = (member.Assignment_Count__c == null ? 0 : member.Assignment_Count__c) + 1;

            if (!membersToUpdate.contains(member)) {
                membersToUpdate.add(member);
            }

            memberIndex = Math.mod(memberIndex + 1, members.size());
        }

        update leadsToUpdate;
        update membersToUpdate;
    }

    private static Round_Robin_Config__c getActiveConfig() {
        List<Round_Robin_Config__c> configs = [
            SELECT Id, Is_Active__c, Fallback_Owner__c
            FROM Round_Robin_Config__c
            WHERE Is_Active__c = true
            LIMIT 1
        ];
        return configs.isEmpty() ? null : configs[0];
    }

    private static List<Round_Robin_Member__c> getAvailableMembers(Id configId) {
        List<Round_Robin_Member__c> members = [
            SELECT Id, User__c, Sort_Order__c, Last_Assigned_Date__c, Assignment_Count__c
            FROM Round_Robin_Member__c
            WHERE Round_Robin_Config__c = :configId
                AND Is_Available__c = true
                AND User__c != null
            FOR UPDATE
        ];
        members.sort(new MemberSortComparator());
        return members;
    }

    private class MemberSortComparator implements Comparator<Round_Robin_Member__c> {
        public Integer compare(Round_Robin_Member__c a, Round_Robin_Member__c b) {
            Integer dateCompare = compareDates(a.Last_Assigned_Date__c, b.Last_Assigned_Date__c);
            if (dateCompare != 0) {
                return dateCompare;
            }
            return compareNumbers(a.Sort_Order__c, b.Sort_Order__c);
        }

        private Integer compareDates(DateTime d1, DateTime d2) {
            if (d1 == null && d2 == null) return 0;
            if (d1 == null) return -1;
            if (d2 == null) return 1;
            if (d1 < d2) return -1;
            if (d1 > d2) return 1;
            return 0;
        }

        private Integer compareNumbers(Decimal n1, Decimal n2) {
            if (n1 == null && n2 == null) return 0;
            if (n1 == null) return -1;
            if (n2 == null) return 1;
            if (n1 < n2) return -1;
            if (n1 > n2) return 1;
            return 0;
        }
    }

    private static void assignToFallback(List<Lead> leads, Round_Robin_Config__c config) {
        if (config.Fallback_Owner__c == null) {
            return;
        }

        List<Lead> leadsToUpdate = new List<Lead>();
        DateTime now = DateTime.now();

        for (Lead ld : leads) {
            leadsToUpdate.add(new Lead(
                Id = ld.Id,
                OwnerId = config.Fallback_Owner__c,
                Round_Robin_Assigned__c = true,
                Round_Robin_Assigned_Date__c = now
            ));
        }

        update leadsToUpdate;
    }

    public class RoundRobinServiceException extends Exception {}
}
