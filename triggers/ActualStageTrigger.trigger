trigger ActualStageTrigger on Actual_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualStageHandler.handleAfterDelete(Trigger.old);
    }
}
