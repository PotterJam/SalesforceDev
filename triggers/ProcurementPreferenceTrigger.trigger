trigger ProcurementPreferenceTrigger on Procurement_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
