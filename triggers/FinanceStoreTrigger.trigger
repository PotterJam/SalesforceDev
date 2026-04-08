trigger FinanceStoreTrigger on Finance_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceStoreHandler.handleAfterDelete(Trigger.old);
    }
}
