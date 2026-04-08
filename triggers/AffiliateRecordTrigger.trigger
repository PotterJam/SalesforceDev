trigger AffiliateRecordTrigger on Affiliate_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateRecordHandler.handleAfterDelete(Trigger.old);
    }
}
