trigger CapacityBindingTrigger on Capacity_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityBindingHandler.handleAfterDelete(Trigger.old);
    }
}
