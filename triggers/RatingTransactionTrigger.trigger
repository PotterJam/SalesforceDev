trigger RatingTransactionTrigger on Rating_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
