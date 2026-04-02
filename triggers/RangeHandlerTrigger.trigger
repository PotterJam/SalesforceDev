trigger RangeHandlerTrigger on Range_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
