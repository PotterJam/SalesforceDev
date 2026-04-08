trigger QuotaProxyTrigger on Quota_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaProxyHandler.handleAfterDelete(Trigger.old);
    }
}
