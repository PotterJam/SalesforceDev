trigger CapacityFlowTrigger on Capacity_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityFlowHandler.handleAfterDelete(Trigger.old);
    }
}
