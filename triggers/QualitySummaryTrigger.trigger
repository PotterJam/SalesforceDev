trigger QualitySummaryTrigger on Quality_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualitySummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualitySummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualitySummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualitySummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualitySummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualitySummaryHandler.handleAfterDelete(Trigger.old);
    }
}
