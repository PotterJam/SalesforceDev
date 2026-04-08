trigger ShiftDeltaTrigger on Shift_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
