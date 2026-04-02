trigger BudgetGatewayTrigger on Budget_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
