trigger ImpactPreferenceTrigger on Impact_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
