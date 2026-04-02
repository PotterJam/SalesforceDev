trigger SupportModuleTrigger on Support_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportModuleHandler.handleAfterDelete(Trigger.old);
    }
}
