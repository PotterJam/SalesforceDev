trigger ShiftHandlerTrigger on Shift_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
