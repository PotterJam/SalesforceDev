trigger ReportStageTrigger on Report_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportStageHandler.handleAfterDelete(Trigger.old);
    }
}
