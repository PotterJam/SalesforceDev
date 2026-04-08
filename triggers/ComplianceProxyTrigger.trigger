trigger ComplianceProxyTrigger on Compliance_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceProxyHandler.handleAfterDelete(Trigger.old);
    }
}
