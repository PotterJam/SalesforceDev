trigger PaymentConnectorTrigger on Payment_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
