trigger ContractEndpointTrigger on Contract_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
