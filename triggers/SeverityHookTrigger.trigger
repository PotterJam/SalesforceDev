trigger SeverityHookTrigger on Severity_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityHookHandler.handleAfterDelete(Trigger.old);
    }
}
