trigger ShiftTransactionTrigger on Shift_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
