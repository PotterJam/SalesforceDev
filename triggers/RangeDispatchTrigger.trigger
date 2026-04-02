trigger RangeDispatchTrigger on Range_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
