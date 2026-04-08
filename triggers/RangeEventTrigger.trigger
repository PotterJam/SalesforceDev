trigger RangeEventTrigger on Range_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeEventHandler.handleAfterDelete(Trigger.old);
    }
}
