trigger ComplianceTrackerTrigger on Compliance_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
