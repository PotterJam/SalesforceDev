trigger CeilingRegistryTrigger on Ceiling_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
