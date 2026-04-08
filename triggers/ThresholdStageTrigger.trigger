trigger ThresholdStageTrigger on Threshold_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdStageHandler.handleAfterDelete(Trigger.old);
    }
}
