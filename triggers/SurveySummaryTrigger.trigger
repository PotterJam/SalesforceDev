trigger SurveySummaryTrigger on Survey_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveySummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveySummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveySummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveySummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveySummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveySummaryHandler.handleAfterDelete(Trigger.old);
    }
}
