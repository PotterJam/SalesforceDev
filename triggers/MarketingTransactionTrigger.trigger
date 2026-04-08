trigger MarketingTransactionTrigger on Marketing_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
