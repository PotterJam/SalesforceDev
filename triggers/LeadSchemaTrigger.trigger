trigger LeadSchemaTrigger on Lead_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
