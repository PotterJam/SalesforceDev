trigger TrainingActionTrigger on Training_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingActionHandler.handleAfterDelete(Trigger.old);
    }
}
