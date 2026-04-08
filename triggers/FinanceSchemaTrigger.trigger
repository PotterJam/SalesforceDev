trigger FinanceSchemaTrigger on Finance_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
