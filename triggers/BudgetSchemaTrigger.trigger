trigger BudgetSchemaTrigger on Budget_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
