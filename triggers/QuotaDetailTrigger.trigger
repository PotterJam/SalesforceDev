trigger QuotaDetailTrigger on Quota_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaDetailHandler.handleAfterDelete(Trigger.old);
    }
}
