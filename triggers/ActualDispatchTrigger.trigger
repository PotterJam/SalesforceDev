trigger ActualDispatchTrigger on Actual_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
