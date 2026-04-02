trigger MarketingSchemaTrigger on Marketing_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
