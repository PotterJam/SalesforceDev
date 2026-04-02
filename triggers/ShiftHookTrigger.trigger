trigger ShiftHookTrigger on Shift_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftHookHandler.handleAfterDelete(Trigger.old);
    }
}
