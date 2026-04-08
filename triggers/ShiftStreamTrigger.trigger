trigger ShiftStreamTrigger on Shift_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftStreamHandler.handleAfterDelete(Trigger.old);
    }
}
