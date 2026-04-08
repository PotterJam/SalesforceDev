trigger CategorySchemaTrigger on Category_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategorySchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategorySchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategorySchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategorySchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategorySchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategorySchemaHandler.handleAfterDelete(Trigger.old);
    }
}
