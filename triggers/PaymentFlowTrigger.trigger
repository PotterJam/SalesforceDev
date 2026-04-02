trigger PaymentFlowTrigger on Payment_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentFlowHandler.handleAfterDelete(Trigger.old);
    }
}
