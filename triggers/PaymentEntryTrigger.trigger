trigger PaymentEntryTrigger on Payment_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentEntryHandler.handleAfterDelete(Trigger.old);
    }
}
