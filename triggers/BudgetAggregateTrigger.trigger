trigger BudgetAggregateTrigger on Budget_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
