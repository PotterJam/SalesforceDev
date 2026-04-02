trigger ReportDispatchTrigger on Report_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
