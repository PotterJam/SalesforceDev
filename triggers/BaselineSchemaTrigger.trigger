trigger BaselineSchemaTrigger on Baseline_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
