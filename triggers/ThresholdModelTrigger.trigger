trigger ThresholdModelTrigger on Threshold_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdModelHandler.handleAfterDelete(Trigger.old);
    }
}
