trigger PaymentPlanTrigger on Payment_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentPlanHandler.handleAfterDelete(Trigger.old);
    }
}
