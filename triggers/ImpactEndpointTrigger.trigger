trigger ImpactEndpointTrigger on Impact_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
