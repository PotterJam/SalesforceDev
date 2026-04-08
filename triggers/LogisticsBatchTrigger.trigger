trigger LogisticsBatchTrigger on Logistics_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsBatchHandler.handleAfterDelete(Trigger.old);
    }
}
