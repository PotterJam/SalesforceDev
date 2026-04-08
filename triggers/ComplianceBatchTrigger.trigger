trigger ComplianceBatchTrigger on Compliance_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceBatchHandler.handleAfterDelete(Trigger.old);
    }
}
