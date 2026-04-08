trigger AssignmentItemTrigger on Assignment_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentItemHandler.handleAfterDelete(Trigger.old);
    }
}
