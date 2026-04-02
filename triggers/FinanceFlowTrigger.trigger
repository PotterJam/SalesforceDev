trigger FinanceFlowTrigger on Finance_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceFlowHandler.handleAfterDelete(Trigger.old);
    }
}
