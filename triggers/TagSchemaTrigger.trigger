trigger TagSchemaTrigger on Tag_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
