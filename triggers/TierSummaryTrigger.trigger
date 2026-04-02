trigger TierSummaryTrigger on Tier_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
