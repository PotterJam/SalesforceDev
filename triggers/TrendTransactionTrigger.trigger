trigger TrendTransactionTrigger on Trend_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
