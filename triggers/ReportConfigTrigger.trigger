trigger ReportConfigTrigger on Report_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportConfigHandler.handleAfterDelete(Trigger.old);
    }
}
