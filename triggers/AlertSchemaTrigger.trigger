trigger AlertSchemaTrigger on Alert_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
