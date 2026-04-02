trigger IndexStoreTrigger on Index_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexStoreHandler.handleAfterDelete(Trigger.old);
    }
}
