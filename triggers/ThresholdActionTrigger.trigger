trigger ThresholdActionTrigger on Threshold_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdActionHandler.handleAfterDelete(Trigger.old);
    }
}
