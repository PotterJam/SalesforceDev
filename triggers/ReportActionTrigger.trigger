trigger ReportActionTrigger on Report_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportActionHandler.handleAfterDelete(Trigger.old);
    }
}
