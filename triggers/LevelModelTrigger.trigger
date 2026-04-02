trigger LevelModelTrigger on Level_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelModelHandler.handleAfterDelete(Trigger.old);
    }
}
