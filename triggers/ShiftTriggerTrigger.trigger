trigger ShiftTriggerTrigger on Shift_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
