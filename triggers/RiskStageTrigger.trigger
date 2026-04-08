trigger RiskStageTrigger on Risk_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskStageHandler.handleAfterDelete(Trigger.old);
    }
}
