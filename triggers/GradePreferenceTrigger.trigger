trigger GradePreferenceTrigger on Grade_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
