trigger MarketingPreferenceTrigger on Marketing_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
