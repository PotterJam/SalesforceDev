trigger ResearchEndpointTrigger on Research_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
