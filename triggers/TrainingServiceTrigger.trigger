trigger TrainingServiceTrigger on Training_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingServiceHandler.handleAfterDelete(Trigger.old);
    }
}
