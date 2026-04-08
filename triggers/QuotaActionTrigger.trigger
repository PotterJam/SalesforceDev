trigger QuotaActionTrigger on Quota_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaActionHandler.handleAfterDelete(Trigger.old);
    }
}
