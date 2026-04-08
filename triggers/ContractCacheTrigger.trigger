trigger ContractCacheTrigger on Contract_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractCacheHandler.handleAfterDelete(Trigger.old);
    }
}
