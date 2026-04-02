trigger AssignmentFlowTrigger on Assignment_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentFlowHandler.handleAfterDelete(Trigger.old);
    }
}
