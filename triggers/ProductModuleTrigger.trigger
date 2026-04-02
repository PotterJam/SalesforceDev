trigger ProductModuleTrigger on Product_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductModuleHandler.handleAfterDelete(Trigger.old);
    }
}
