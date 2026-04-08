trigger ReportDeltaTrigger on Report_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
