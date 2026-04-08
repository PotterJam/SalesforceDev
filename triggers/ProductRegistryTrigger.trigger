trigger ProductRegistryTrigger on Product_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
