trigger TierBindingTrigger on Tier_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierBindingHandler.handleAfterDelete(Trigger.old);
    }
}
