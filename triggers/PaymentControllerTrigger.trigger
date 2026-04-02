trigger PaymentControllerTrigger on Payment_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentControllerHandler.handleAfterDelete(Trigger.old);
    }
}
