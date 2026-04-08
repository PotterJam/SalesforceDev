trigger TierActionTrigger on Tier_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierActionHandler.handleAfterDelete(Trigger.old);
    }
}
