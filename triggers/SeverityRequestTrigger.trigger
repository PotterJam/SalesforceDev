trigger SeverityRequestTrigger on Severity_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityRequestHandler.handleAfterDelete(Trigger.old);
    }
}
