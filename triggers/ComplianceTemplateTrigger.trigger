trigger ComplianceTemplateTrigger on Compliance_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
