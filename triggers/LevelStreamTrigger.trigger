trigger LevelStreamTrigger on Level_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelStreamHandler.handleAfterDelete(Trigger.old);
    }
}
