trigger BudgetConnectorTrigger on Budget_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
