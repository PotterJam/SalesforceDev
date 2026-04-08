trigger TargetSummaryTrigger on Target_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
