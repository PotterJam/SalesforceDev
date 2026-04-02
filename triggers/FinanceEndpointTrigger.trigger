trigger FinanceEndpointTrigger on Finance_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
