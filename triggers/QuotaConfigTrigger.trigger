trigger QuotaConfigTrigger on Quota_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaConfigHandler.handleAfterDelete(Trigger.old);
    }
}
