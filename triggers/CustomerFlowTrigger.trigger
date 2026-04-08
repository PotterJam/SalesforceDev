trigger CustomerFlowTrigger on Customer_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerFlowHandler.handleAfterDelete(Trigger.old);
    }
}
