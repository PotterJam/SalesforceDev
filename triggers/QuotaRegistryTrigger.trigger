trigger QuotaRegistryTrigger on Quota_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
