trigger ComplianceRecordTrigger on Compliance_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceRecordHandler.handleAfterDelete(Trigger.old);
    }
}
