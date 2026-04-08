trigger ShiftJobTrigger on Shift_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftJobHandler.handleAfterDelete(Trigger.old);
    }
}
