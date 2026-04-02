trigger TierAggregateTrigger on Tier_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
