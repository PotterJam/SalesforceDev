trigger LevelStageTrigger on Level_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelStageHandler.handleAfterDelete(Trigger.old);
    }
}
