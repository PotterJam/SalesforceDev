trigger FinanceProcessorTrigger on Finance_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
