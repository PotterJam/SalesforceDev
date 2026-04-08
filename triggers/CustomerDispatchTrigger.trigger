trigger CustomerDispatchTrigger on Customer_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
