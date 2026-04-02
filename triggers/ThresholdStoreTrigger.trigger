trigger ThresholdStoreTrigger on Threshold_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdStoreHandler.handleAfterDelete(Trigger.old);
    }
}
