trigger LogisticsStoreTrigger on Logistics_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsStoreHandler.handleAfterDelete(Trigger.old);
    }
}
