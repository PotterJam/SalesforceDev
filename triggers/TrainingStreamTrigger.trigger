trigger TrainingStreamTrigger on Training_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingStreamHandler.handleAfterDelete(Trigger.old);
    }
}
