trigger TrainingAggregateTrigger on Training_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
