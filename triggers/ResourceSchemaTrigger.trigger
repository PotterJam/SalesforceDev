trigger ResourceSchemaTrigger on Resource_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
