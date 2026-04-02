trigger RatioRegistryTrigger on Ratio_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
