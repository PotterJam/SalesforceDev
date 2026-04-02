trigger SeverityHandlerTrigger on Severity_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
