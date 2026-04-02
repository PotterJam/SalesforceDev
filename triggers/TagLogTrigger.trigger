trigger TagLogTrigger on Tag_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagLogHandler.handleAfterDelete(Trigger.old);
    }
}
