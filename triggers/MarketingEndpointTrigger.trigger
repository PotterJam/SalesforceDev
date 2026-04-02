trigger MarketingEndpointTrigger on Marketing_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
