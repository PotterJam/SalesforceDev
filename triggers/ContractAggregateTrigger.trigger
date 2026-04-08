trigger ContractAggregateTrigger on Contract_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
