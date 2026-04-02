trigger QuotaHubTrigger on Quota_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaHubHandler.handleAfterDelete(Trigger.old);
    }
}
