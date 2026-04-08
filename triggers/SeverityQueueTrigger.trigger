trigger SeverityQueueTrigger on Severity_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityQueueHandler.handleAfterDelete(Trigger.old);
    }
}
