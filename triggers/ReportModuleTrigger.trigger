trigger ReportModuleTrigger on Report_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportModuleHandler.handleAfterDelete(Trigger.old);
    }
}
