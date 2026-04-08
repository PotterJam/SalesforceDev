trigger OpportunityRecordTrigger on Opportunity_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRecordHandler.handleAfterDelete(Trigger.old);
    }
}
