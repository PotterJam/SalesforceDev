trigger PaymentItemTrigger on Payment_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentItemHandler.handleAfterDelete(Trigger.old);
    }
}
