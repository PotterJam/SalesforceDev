trigger MilestoneSummaryTrigger on Milestone_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
