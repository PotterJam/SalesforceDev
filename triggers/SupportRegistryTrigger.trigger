trigger SupportRegistryTrigger on Support_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
