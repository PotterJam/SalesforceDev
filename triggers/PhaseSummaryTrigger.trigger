trigger PhaseSummaryTrigger on Phase_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
