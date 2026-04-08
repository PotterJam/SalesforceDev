trigger PaymentModuleTrigger on Payment_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentModuleHandler.handleAfterDelete(Trigger.old);
    }
}
