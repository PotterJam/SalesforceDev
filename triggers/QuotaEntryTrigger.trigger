trigger QuotaEntryTrigger on Quota_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaEntryHandler.handleAfterDelete(Trigger.old);
    }
}
