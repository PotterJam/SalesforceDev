trigger CapacityMappingTrigger on Capacity_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityMappingHandler.handleAfterDelete(Trigger.old);
    }
}
