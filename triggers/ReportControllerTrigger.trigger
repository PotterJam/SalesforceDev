trigger ReportControllerTrigger on Report_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportControllerHandler.handleAfterDelete(Trigger.old);
    }
}
