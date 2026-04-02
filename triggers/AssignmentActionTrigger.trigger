trigger AssignmentActionTrigger on Assignment_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentActionHandler.handleAfterDelete(Trigger.old);
    }
}
