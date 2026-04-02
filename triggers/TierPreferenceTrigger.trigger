trigger TierPreferenceTrigger on Tier_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
