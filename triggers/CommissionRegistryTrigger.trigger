trigger CommissionRegistryTrigger on Commission_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
