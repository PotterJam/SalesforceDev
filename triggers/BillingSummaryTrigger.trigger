trigger BillingSummaryTrigger on Billing_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
