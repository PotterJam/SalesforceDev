trigger ReportSchemaTrigger on Report_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
