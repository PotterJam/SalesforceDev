trigger FinanceAggregateTrigger on Finance_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
