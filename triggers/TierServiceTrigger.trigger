trigger TierServiceTrigger on Tier_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierServiceHandler.handleAfterDelete(Trigger.old);
    }
}
