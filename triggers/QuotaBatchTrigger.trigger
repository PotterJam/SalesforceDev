trigger QuotaBatchTrigger on Quota_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaBatchHandler.handleAfterDelete(Trigger.old);
    }
}
