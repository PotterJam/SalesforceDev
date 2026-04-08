trigger ApprovalCacheTrigger on Approval_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalCacheHandler.handleAfterDelete(Trigger.old);
    }
}
