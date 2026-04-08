trigger QuotaSchemaTrigger on Quota_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
