trigger ReportAggregateTrigger on Report_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
