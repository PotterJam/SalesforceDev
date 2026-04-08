trigger OpportunityControllerTrigger on Opportunity_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityControllerHandler.handleAfterDelete(Trigger.old);
    }
}
