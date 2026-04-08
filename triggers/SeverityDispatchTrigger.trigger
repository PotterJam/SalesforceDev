trigger SeverityDispatchTrigger on Severity_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
