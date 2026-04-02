trigger ShiftViewTrigger on Shift_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftViewHandler.handleAfterDelete(Trigger.old);
    }
}
