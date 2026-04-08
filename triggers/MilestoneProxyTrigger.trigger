trigger MilestoneProxyTrigger on Milestone_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneProxyHandler.handleAfterDelete(Trigger.old);
    }
}
