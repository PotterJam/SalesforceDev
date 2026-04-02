trigger LeadBatchTrigger on Lead_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadBatchHandler.handleAfterDelete(Trigger.old);
    }
}
