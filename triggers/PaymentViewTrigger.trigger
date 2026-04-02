trigger PaymentViewTrigger on Payment_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentViewHandler.handleAfterDelete(Trigger.old);
    }
}
