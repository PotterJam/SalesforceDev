trigger SalesFlowTrigger on Sales_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesFlowHandler.handleAfterDelete(Trigger.old);
    }
}
