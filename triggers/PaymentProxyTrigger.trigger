trigger PaymentProxyTrigger on Payment_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentProxyHandler.handleAfterDelete(Trigger.old);
    }
}
