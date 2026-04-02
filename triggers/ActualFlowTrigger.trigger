trigger ActualFlowTrigger on Actual_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualFlowHandler.handleAfterDelete(Trigger.old);
    }
}
