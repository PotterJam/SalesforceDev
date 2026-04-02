trigger RangeAdapterTrigger on Range_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
