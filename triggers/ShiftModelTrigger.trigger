trigger ShiftModelTrigger on Shift_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftModelHandler.handleAfterDelete(Trigger.old);
    }
}
