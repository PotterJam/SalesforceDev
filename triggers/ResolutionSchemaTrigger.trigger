trigger ResolutionSchemaTrigger on Resolution_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
