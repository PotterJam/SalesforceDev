trigger OpportunityPreferenceTrigger on Opportunity_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
