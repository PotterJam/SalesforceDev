trigger UtilizationRegistryTrigger on Utilization_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
