trigger ReviewRegistryTrigger on Review_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
