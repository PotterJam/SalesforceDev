trigger TrainingFlowTrigger on Training_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingFlowHandler.handleAfterDelete(Trigger.old);
    }
}
