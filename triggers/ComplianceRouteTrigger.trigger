trigger ComplianceRouteTrigger on Compliance_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceRouteHandler.handleAfterDelete(Trigger.old);
    }
}
