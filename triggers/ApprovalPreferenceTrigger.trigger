trigger ApprovalPreferenceTrigger on Approval_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
