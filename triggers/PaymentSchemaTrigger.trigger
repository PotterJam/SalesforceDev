trigger PaymentSchemaTrigger on Payment_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
