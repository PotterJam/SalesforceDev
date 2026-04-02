trigger AssignmentEventTrigger on Assignment_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentEventHandler.handleAfterDelete(Trigger.old);
    }
}
