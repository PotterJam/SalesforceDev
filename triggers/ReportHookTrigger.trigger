trigger ReportHookTrigger on Report_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportHookHandler.handleAfterDelete(Trigger.old);
    }
}
