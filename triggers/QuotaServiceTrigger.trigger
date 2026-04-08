trigger QuotaServiceTrigger on Quota_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaServiceHandler.handleAfterDelete(Trigger.old);
    }
}
