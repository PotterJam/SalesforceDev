trigger FinanceArchiveTrigger on Finance_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
