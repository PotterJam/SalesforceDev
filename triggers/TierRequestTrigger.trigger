trigger TierRequestTrigger on Tier_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierRequestHandler.handleAfterDelete(Trigger.old);
    }
}
