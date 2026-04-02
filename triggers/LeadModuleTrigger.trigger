trigger LeadModuleTrigger on Lead_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadModuleHandler.handleAfterDelete(Trigger.old);
    }
}
