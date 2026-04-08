trigger ComplianceLinkTrigger on Compliance_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceLinkHandler.handleAfterDelete(Trigger.old);
    }
}
