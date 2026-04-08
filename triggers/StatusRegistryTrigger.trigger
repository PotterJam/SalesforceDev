trigger StatusRegistryTrigger on Status_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
