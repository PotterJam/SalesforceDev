trigger AffiliateFeedTrigger on Affiliate_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateFeedHandler.handleAfterDelete(Trigger.old);
    }
}
