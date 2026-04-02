trigger MarketingModuleTrigger on Marketing_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingModuleHandler.handleAfterDelete(Trigger.old);
    }
}
