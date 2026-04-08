trigger PaymentNodeTrigger on Payment_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentNodeHandler.handleAfterDelete(Trigger.old);
    }
}
