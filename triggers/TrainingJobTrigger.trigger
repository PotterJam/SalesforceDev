trigger TrainingJobTrigger on Training_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingJobHandler.handleAfterDelete(Trigger.old);
    }
}
