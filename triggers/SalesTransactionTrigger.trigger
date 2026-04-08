trigger SalesTransactionTrigger on Sales_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
