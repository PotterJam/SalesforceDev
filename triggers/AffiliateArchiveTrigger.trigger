trigger AffiliateArchiveTrigger on Affiliate_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
