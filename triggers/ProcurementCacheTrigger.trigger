trigger ProcurementCacheTrigger on Procurement_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementCacheHandler.handleAfterDelete(Trigger.old);
    }
}
