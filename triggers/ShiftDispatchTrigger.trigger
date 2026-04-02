trigger ShiftDispatchTrigger on Shift_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
