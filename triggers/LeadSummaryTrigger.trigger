trigger LeadSummaryTrigger on Lead_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
