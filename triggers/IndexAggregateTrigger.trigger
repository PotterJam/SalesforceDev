trigger IndexAggregateTrigger on Index_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
