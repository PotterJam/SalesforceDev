trigger ResolutionSummaryTrigger on Resolution_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
