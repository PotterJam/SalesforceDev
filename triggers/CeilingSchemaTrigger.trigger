trigger CeilingSchemaTrigger on Ceiling_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
