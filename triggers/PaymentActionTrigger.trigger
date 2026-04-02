trigger PaymentActionTrigger on Payment_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentActionHandler.handleAfterDelete(Trigger.old);
    }
}
