trigger ShiftEventTrigger on Shift_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftEventHandler.handleAfterDelete(Trigger.old);
    }
}
