trigger BudgetFlowTrigger on Budget_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetFlowHandler.handleAfterDelete(Trigger.old);
    }
}
