trigger CategoryRegistryTrigger on Category_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
