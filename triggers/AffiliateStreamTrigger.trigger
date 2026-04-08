trigger AffiliateStreamTrigger on Affiliate_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateStreamHandler.handleAfterDelete(Trigger.old);
    }
}
