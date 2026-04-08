trigger SalesRegistryTrigger on Sales_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
