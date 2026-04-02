trigger QuotaViewTrigger on Quota_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaViewHandler.handleAfterDelete(Trigger.old);
    }
}
