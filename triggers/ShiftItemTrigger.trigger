trigger ShiftItemTrigger on Shift_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftItemHandler.handleAfterDelete(Trigger.old);
    }
}
