trigger QuotaDeltaTrigger on Quota_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
