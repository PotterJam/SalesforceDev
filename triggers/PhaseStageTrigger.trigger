trigger PhaseStageTrigger on Phase_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseStageHandler.handleAfterDelete(Trigger.old);
    }
}
