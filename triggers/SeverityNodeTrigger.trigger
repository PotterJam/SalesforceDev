trigger SeverityNodeTrigger on Severity_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityNodeHandler.handleAfterDelete(Trigger.old);
    }
}
