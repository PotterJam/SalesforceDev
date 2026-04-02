trigger TrainingRecordTrigger on Training_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingRecordHandler.handleAfterDelete(Trigger.old);
    }
}
