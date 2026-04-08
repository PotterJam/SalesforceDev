trigger ThresholdDetailTrigger on Threshold_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdDetailHandler.handleAfterDelete(Trigger.old);
    }
}
