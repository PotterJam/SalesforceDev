trigger QuotaLinkTrigger on Quota_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaLinkHandler.handleAfterDelete(Trigger.old);
    }
}
