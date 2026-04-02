trigger LevelQueueTrigger on Level_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelQueueHandler.handleAfterDelete(Trigger.old);
    }
}
