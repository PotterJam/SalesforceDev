trigger TrainingControllerTrigger on Training_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingControllerHandler.handleAfterDelete(Trigger.old);
    }
}
