trigger CommissionPreferenceTrigger on Commission_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
