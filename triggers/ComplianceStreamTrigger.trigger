trigger ComplianceStreamTrigger on Compliance_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceStreamHandler.handleAfterDelete(Trigger.old);
    }
}
