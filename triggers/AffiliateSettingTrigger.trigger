trigger AffiliateSettingTrigger on Affiliate_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateSettingHandler.handleAfterDelete(Trigger.old);
    }
}
