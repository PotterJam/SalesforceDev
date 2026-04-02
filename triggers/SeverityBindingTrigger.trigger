trigger SeverityBindingTrigger on Severity_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityBindingHandler.handleAfterDelete(Trigger.old);
    }
}
