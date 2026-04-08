trigger SeverityTriggerTrigger on Severity_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
