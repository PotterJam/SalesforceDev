trigger AssignmentControllerTrigger on Assignment_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentControllerHandler.handleAfterDelete(Trigger.old);
    }
}
