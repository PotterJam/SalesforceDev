trigger ProductStoreTrigger on Product_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductStoreHandler.handleAfterDelete(Trigger.old);
    }
}
