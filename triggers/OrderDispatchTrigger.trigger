trigger OrderDispatchTrigger on Order_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
