trigger TierJobTrigger on Tier_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierJobHandler.handleAfterDelete(Trigger.old);
    }
}
