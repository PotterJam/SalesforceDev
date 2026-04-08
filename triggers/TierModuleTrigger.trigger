trigger TierModuleTrigger on Tier_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierModuleHandler.handleAfterDelete(Trigger.old);
    }
}
