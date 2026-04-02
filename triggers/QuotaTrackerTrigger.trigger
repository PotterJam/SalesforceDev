trigger QuotaTrackerTrigger on Quota_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
