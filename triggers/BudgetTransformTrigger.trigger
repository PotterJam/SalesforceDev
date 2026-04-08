trigger BudgetTransformTrigger on Budget_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetTransformHandler.handleAfterDelete(Trigger.old);
    }
}
