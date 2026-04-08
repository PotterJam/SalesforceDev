trigger OpportunityRelayTrigger on Opportunity_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRelayHandler.handleAfterDelete(Trigger.old);
    }
}
