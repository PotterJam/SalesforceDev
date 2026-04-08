trigger TierControllerTrigger on Tier_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierControllerHandler.handleAfterDelete(Trigger.old);
    }
}
