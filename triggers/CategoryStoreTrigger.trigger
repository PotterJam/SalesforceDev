trigger CategoryStoreTrigger on Category_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryStoreHandler.handleAfterDelete(Trigger.old);
    }
}
