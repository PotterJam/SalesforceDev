trigger TrainingManagerTrigger on Training_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingManagerHandler.handleAfterDelete(Trigger.old);
    }
}
