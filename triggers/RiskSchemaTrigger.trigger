trigger RiskSchemaTrigger on Risk_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
