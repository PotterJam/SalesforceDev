trigger AssignmentJobTrigger on Assignment_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentJobHandler.handleAfterDelete(Trigger.old);
    }
}
