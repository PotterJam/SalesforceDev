trigger CoverageStageTrigger on Coverage_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageStageHandler.handleAfterDelete(Trigger.old);
    }
}
