trigger ComplianceStageTrigger on Compliance_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceStageHandler.handleAfterDelete(Trigger.old);
    }
}
