trigger ReviewSchemaTrigger on Review_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
