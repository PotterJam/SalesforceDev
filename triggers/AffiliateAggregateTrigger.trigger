trigger AffiliateAggregateTrigger on Affiliate_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
