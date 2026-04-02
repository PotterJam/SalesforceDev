trigger PayrollCatalogTrigger on Payroll_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
