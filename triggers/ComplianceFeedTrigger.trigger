trigger ComplianceFeedTrigger on Compliance_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceFeedHandler.handleAfterDelete(Trigger.old);
    }
}
