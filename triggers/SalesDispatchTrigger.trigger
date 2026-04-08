trigger SalesDispatchTrigger on Sales_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
