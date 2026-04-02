trigger LimitTransactionTrigger on Limit_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
