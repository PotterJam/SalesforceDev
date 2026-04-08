trigger FinanceRecordTrigger on Finance_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceRecordHandler.handleAfterDelete(Trigger.old);
    }
}
