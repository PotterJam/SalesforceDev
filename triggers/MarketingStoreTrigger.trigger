trigger MarketingStoreTrigger on Marketing_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingStoreHandler.handleAfterDelete(Trigger.old);
    }
}
