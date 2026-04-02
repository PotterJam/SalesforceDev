trigger StatusFlowTrigger on Status_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusFlowHandler.handleAfterDelete(Trigger.old);
    }
}
