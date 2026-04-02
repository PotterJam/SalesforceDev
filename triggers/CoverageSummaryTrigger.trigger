trigger CoverageSummaryTrigger on Coverage_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
