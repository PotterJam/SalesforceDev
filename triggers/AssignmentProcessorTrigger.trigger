trigger AssignmentProcessorTrigger on Assignment_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
