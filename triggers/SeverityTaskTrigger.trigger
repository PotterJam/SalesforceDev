trigger SeverityTaskTrigger on Severity_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityTaskHandler.handleAfterDelete(Trigger.old);
    }
}
