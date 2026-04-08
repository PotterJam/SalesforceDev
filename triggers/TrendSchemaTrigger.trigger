trigger TrendSchemaTrigger on Trend_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
