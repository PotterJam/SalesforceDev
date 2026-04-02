trigger AssignmentTaskTrigger on Assignment_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentTaskHandler.handleAfterDelete(Trigger.old);
    }
}
