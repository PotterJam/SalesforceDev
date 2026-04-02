trigger RiskAggregateTrigger on Risk_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
