trigger TrainingNodeTrigger on Training_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingNodeHandler.handleAfterDelete(Trigger.old);
    }
}
