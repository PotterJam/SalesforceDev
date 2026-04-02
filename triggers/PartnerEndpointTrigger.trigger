trigger PartnerEndpointTrigger on Partner_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
