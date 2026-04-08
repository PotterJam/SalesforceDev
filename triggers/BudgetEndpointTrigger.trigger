trigger BudgetEndpointTrigger on Budget_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
