trigger SeverityActionTrigger on Severity_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityActionHandler.handleAfterDelete(Trigger.old);
    }
}
