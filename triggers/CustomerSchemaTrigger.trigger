trigger CustomerSchemaTrigger on Customer_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
