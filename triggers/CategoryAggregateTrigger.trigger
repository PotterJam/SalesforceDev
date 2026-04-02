trigger CategoryAggregateTrigger on Category_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
