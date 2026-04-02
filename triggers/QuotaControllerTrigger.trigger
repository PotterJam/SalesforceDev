trigger QuotaControllerTrigger on Quota_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaControllerHandler.handleAfterDelete(Trigger.old);
    }
}
