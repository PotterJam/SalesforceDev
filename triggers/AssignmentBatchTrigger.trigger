trigger AssignmentBatchTrigger on Assignment_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentBatchHandler.handleAfterDelete(Trigger.old);
    }
}
