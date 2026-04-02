trigger QuotaSummaryTrigger on Quota_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
