trigger PrioritySummaryTrigger on Priority_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PrioritySummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PrioritySummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PrioritySummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PrioritySummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PrioritySummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PrioritySummaryHandler.handleAfterDelete(Trigger.old);
    }
}
