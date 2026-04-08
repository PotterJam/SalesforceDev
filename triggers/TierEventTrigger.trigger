trigger TierEventTrigger on Tier_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierEventHandler.handleAfterDelete(Trigger.old);
    }
}
