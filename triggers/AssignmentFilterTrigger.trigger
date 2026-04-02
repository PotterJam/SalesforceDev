trigger AssignmentFilterTrigger on Assignment_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentFilterHandler.handleAfterDelete(Trigger.old);
    }
}
