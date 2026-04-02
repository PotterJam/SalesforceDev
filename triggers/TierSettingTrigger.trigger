trigger TierSettingTrigger on Tier_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierSettingHandler.handleAfterDelete(Trigger.old);
    }
}
