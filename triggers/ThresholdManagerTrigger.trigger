trigger ThresholdManagerTrigger on Threshold_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdManagerHandler.handleAfterDelete(Trigger.old);
    }
}
