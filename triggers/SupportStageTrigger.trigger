trigger SupportStageTrigger on Support_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportStageHandler.handleAfterDelete(Trigger.old);
    }
}
