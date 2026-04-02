trigger IndexSchemaTrigger on Index_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
