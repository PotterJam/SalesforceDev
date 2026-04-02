trigger OpportunityTransformTrigger on Opportunity_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityTransformHandler.handleAfterDelete(Trigger.old);
    }
}
