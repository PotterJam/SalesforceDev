trigger TierViewTrigger on Tier_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierViewHandler.handleAfterDelete(Trigger.old);
    }
}
