trigger TrendStoreTrigger on Trend_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendStoreHandler.handleAfterDelete(Trigger.old);
    }
}
