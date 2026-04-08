trigger OpportunityNodeTrigger on Opportunity_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityNodeHandler.handleAfterDelete(Trigger.old);
    }
}
