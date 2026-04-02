trigger TierPluginTrigger on Tier_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierPluginHandler.handleAfterDelete(Trigger.old);
    }
}
