trigger DurationSummaryTrigger on Duration_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
