trigger CoverageModuleTrigger on Coverage_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageModuleHandler.handleAfterDelete(Trigger.old);
    }
}
