trigger ReportTriggerTrigger on Report_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
