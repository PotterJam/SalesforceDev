trigger PaymentSummaryTrigger on Payment_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
