trigger TrainingAdapterTrigger on Training_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
