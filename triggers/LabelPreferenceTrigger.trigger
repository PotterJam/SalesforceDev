trigger LabelPreferenceTrigger on Label_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
