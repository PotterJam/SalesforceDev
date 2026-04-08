trigger CapacityDispatchTrigger on Capacity_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
