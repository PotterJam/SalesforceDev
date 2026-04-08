trigger FloorSchemaTrigger on Floor_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
