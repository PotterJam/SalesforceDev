trigger SeverityModuleTrigger on Severity_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityModuleHandler.handleAfterDelete(Trigger.old);
    }
}
