trigger TrainingDispatchTrigger on Training_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
