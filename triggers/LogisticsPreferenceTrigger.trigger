trigger LogisticsPreferenceTrigger on Logistics_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
