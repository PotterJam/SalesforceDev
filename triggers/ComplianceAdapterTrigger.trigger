trigger ComplianceAdapterTrigger on Compliance_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
