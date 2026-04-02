trigger StatusSummaryTrigger on Status_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
