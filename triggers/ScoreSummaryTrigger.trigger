trigger ScoreSummaryTrigger on Score_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
