trigger ThresholdRegistryTrigger on Threshold_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
