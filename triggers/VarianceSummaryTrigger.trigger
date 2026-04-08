trigger VarianceSummaryTrigger on Variance_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
