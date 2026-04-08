trigger FinanceTransactionTrigger on Finance_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
