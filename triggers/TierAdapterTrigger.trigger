trigger TierAdapterTrigger on Tier_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
