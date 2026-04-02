trigger ComplianceModelTrigger on Compliance_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceModelHandler.handleAfterDelete(Trigger.old);
    }
}
