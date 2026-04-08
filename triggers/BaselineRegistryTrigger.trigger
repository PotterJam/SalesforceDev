trigger BaselineRegistryTrigger on Baseline_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
