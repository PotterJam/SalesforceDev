trigger FinanceAdapterTrigger on Finance_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
