trigger SalesAggregateTrigger on Sales_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
