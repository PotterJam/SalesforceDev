trigger ReportFilterTrigger on Report_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportFilterHandler.handleAfterDelete(Trigger.old);
    }
}
