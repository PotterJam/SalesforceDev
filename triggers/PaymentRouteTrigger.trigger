trigger PaymentRouteTrigger on Payment_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentRouteHandler.handleAfterDelete(Trigger.old);
    }
}
