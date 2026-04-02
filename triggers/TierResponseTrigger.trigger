trigger TierResponseTrigger on Tier_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierResponseHandler.handleAfterDelete(Trigger.old);
    }
}
