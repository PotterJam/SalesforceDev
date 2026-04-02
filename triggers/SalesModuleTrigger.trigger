trigger SalesModuleTrigger on Sales_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesModuleHandler.handleAfterDelete(Trigger.old);
    }
}
