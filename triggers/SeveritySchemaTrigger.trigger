trigger SeveritySchemaTrigger on Severity_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeveritySchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeveritySchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeveritySchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeveritySchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeveritySchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeveritySchemaHandler.handleAfterDelete(Trigger.old);
    }
}
