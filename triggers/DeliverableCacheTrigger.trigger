trigger DeliverableCacheTrigger on Deliverable_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableCacheHandler.handleAfterDelete(Trigger.old);
    }
}
