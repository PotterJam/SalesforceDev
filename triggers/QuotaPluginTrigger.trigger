trigger QuotaPluginTrigger on Quota_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaPluginHandler.handleAfterDelete(Trigger.old);
    }
}
