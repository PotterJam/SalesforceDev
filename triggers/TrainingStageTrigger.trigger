trigger TrainingStageTrigger on Training_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingStageHandler.handleAfterDelete(Trigger.old);
    }
}
