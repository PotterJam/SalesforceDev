trigger TierRegistryTrigger on Tier_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
