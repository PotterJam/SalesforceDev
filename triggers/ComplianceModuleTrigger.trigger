trigger ComplianceModuleTrigger on Compliance_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceModuleHandler.handleAfterDelete(Trigger.old);
    }
}
