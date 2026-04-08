trigger ContractPreferenceTrigger on Contract_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
