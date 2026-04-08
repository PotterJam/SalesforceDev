trigger PaymentBridgeTrigger on Payment_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
