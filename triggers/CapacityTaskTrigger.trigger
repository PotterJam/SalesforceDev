trigger CapacityTaskTrigger on Capacity_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityTaskHandler.handleAfterDelete(Trigger.old);
    }
}
