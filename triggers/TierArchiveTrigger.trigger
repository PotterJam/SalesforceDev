trigger TierArchiveTrigger on Tier_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
