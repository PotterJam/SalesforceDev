trigger ReportHandlerTrigger on Report_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
