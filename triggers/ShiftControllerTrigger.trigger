trigger ShiftControllerTrigger on Shift_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftControllerHandler.handleAfterDelete(Trigger.old);
    }
}
