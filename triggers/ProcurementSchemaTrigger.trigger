trigger ProcurementSchemaTrigger on Procurement_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
