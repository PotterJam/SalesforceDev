trigger ActualSchemaTrigger on Actual_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
