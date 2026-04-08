trigger AffiliateLinkTrigger on Affiliate_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateLinkHandler.handleAfterDelete(Trigger.old);
    }
}
