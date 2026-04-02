trigger CustomerStoreTrigger on Customer_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerStoreHandler.handleAfterDelete(Trigger.old);
    }
}
