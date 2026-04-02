trigger CommissionSummaryTrigger on Commission_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
