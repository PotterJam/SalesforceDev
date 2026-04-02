trigger ContractSchemaTrigger on Contract_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
