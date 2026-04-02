trigger OpportunityModelTrigger on Opportunity_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityModelHandler.handleAfterDelete(Trigger.old);
    }
}
