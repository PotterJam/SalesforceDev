trigger FinanceModelTrigger on Finance_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceModelHandler.handleAfterDelete(Trigger.old);
    }
}
