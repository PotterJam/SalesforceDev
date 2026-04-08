trigger ReviewStageTrigger on Review_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewStageHandler.handleAfterDelete(Trigger.old);
    }
}
