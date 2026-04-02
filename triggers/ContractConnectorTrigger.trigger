trigger ContractConnectorTrigger on Contract_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
