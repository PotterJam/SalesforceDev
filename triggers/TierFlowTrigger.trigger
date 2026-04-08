trigger TierFlowTrigger on Tier_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierFlowHandler.handleAfterDelete(Trigger.old);
    }
}
