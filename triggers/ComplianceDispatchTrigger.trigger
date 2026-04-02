trigger ComplianceDispatchTrigger on Compliance_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
