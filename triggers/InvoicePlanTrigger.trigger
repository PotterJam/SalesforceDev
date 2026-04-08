trigger InvoicePlanTrigger on Invoice_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoicePlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoicePlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoicePlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoicePlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoicePlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoicePlanHandler.handleAfterDelete(Trigger.old);
    }
}
