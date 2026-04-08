trigger StatusLogTrigger on Status_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusLogHandler.handleAfterDelete(Trigger.old);
    }
}
