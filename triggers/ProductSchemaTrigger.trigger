trigger ProductSchemaTrigger on Product_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
