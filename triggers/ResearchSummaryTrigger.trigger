trigger ResearchSummaryTrigger on Research_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
