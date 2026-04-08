trigger RatioSchemaTrigger on Ratio_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
