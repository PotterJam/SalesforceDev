trigger RangeStoreTrigger on Range_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeStoreHandler.handleAfterDelete(Trigger.old);
    }
}
