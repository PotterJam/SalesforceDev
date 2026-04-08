trigger TrainingTriggerTrigger on Training_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
