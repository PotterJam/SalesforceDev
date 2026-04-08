trigger ShiftFilterTrigger on Shift_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftFilterHandler.handleAfterDelete(Trigger.old);
    }
}
