trigger ProductDispatchTrigger on Product_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
