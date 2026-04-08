trigger ReportPolicyTrigger on Report_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
