trigger LevelStoreTrigger on Level_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelStoreHandler.handleAfterDelete(Trigger.old);
    }
}
