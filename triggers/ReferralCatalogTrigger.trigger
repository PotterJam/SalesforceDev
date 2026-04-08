trigger ReferralCatalogTrigger on Referral_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
