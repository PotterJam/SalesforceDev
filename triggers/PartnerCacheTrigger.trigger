trigger PartnerCacheTrigger on Partner_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerCacheHandler.handleAfterDelete(Trigger.old);
    }
}
