trigger CapacityCacheTrigger on Capacity_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityCacheHandler.handleAfterDelete(Trigger.old);
    }
}
