trigger AssignmentNodeTrigger on Assignment_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentNodeHandler.handleAfterDelete(Trigger.old);
    }
}
