trigger QuotaModuleTrigger on Quota_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaModuleHandler.handleAfterDelete(Trigger.old);
    }
}
