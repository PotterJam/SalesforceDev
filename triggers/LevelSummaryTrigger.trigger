trigger LevelSummaryTrigger on Level_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
