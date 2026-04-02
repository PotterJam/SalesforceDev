trigger RangeSummaryTrigger on Range_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
