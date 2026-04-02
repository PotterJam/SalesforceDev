trigger ImpactStageTrigger on Impact_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactStageHandler.handleAfterDelete(Trigger.old);
    }
}
