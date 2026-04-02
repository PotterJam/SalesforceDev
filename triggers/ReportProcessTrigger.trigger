trigger ReportProcessTrigger on Report_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportProcessHandler.handleAfterDelete(Trigger.old);
    }
}
