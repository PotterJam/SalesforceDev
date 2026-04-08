trigger TrainingRelayTrigger on Training_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingRelayHandler.handleAfterDelete(Trigger.old);
    }
}
