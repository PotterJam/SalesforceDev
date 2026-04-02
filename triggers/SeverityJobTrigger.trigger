trigger SeverityJobTrigger on Severity_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityJobHandler.handleAfterDelete(Trigger.old);
    }
}
