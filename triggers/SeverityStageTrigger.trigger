trigger SeverityStageTrigger on Severity_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityStageHandler.handleAfterDelete(Trigger.old);
    }
}
