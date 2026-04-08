trigger ThresholdViewTrigger on Threshold_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdViewHandler.handleAfterDelete(Trigger.old);
    }
}
