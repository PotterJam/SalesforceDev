trigger CommissionSchemaTrigger on Commission_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
