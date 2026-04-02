trigger RangeRegistryTrigger on Range_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
