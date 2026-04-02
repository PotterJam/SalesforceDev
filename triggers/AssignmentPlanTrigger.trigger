trigger AssignmentPlanTrigger on Assignment_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentPlanHandler.handleAfterDelete(Trigger.old);
    }
}
