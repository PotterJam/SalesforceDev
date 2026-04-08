trigger MarketingAggregateTrigger on Marketing_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
