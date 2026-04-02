trigger FinanceModuleTrigger on Finance_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceModuleHandler.handleAfterDelete(Trigger.old);
    }
}
