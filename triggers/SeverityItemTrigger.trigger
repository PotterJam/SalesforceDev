trigger SeverityItemTrigger on Severity_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityItemHandler.handleAfterDelete(Trigger.old);
    }
}
