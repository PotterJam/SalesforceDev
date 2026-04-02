trigger AffiliateTemplateTrigger on Affiliate_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
