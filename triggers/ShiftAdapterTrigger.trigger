trigger ShiftAdapterTrigger on Shift_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
