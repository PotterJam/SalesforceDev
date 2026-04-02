trigger VarianceTransactionTrigger on Variance_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
