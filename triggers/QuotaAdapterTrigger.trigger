trigger QuotaAdapterTrigger on Quota_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
