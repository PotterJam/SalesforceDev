trigger LevelLogTrigger on Level_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelLogHandler.handleAfterDelete(Trigger.old);
    }
}
