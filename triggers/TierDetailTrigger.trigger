trigger TierDetailTrigger on Tier_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierDetailHandler.handleAfterDelete(Trigger.old);
    }
}
