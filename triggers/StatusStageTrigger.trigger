trigger StatusStageTrigger on Status_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusStageHandler.handleAfterDelete(Trigger.old);
    }
}
