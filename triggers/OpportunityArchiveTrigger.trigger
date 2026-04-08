trigger OpportunityArchiveTrigger on Opportunity_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
