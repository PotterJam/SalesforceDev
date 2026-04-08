trigger RatioStageTrigger on Ratio_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioStageHandler.handleAfterDelete(Trigger.old);
    }
}
