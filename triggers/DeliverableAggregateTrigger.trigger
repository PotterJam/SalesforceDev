trigger DeliverableAggregateTrigger on Deliverable_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
