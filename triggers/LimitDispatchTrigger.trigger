trigger LimitDispatchTrigger on Limit_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
