trigger AffiliateSummaryTrigger on Affiliate_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
