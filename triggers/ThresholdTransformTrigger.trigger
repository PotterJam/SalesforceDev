trigger ThresholdTransformTrigger on Threshold_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdTransformHandler.handleAfterDelete(Trigger.old);
    }
}
