trigger ProjectRegistryTrigger on Project_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
