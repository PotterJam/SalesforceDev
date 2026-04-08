trigger ImpactSummaryTrigger on Impact_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
