trigger FrequencyStageTrigger on Frequency_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyStageHandler.handleAfterDelete(Trigger.old);
    }
}
