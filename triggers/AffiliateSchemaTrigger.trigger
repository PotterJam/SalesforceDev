trigger AffiliateSchemaTrigger on Affiliate_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
