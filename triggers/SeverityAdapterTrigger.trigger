trigger SeverityAdapterTrigger on Severity_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
