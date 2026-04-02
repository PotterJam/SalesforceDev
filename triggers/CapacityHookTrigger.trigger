trigger CapacityHookTrigger on Capacity_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityHookHandler.handleAfterDelete(Trigger.old);
    }
}
