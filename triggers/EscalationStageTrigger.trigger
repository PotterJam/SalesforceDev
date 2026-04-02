trigger EscalationStageTrigger on Escalation_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationStageHandler.handleAfterDelete(Trigger.old);
    }
}
