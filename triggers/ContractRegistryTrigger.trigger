trigger ContractRegistryTrigger on Contract_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
