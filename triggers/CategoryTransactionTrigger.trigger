trigger CategoryTransactionTrigger on Category_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
