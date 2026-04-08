trigger AssignmentSummaryTrigger on Assignment_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
