trigger SeverityResponseTrigger on Severity_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityResponseHandler.handleAfterDelete(Trigger.old);
    }
}
