trigger ShiftLogTrigger on Shift_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftLogHandler.handleAfterDelete(Trigger.old);
    }
}
