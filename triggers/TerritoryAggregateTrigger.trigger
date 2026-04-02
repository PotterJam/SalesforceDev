trigger TerritoryAggregateTrigger on Territory_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
