trigger FinanceConnectorTrigger on Finance_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
