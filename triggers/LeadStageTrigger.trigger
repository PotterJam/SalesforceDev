trigger LeadStageTrigger on Lead_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadStageHandler.handleAfterDelete(Trigger.old);
    }
}
