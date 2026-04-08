trigger TrainingTransactionTrigger on Training_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
