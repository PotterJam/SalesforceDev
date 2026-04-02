trigger ProjectStageTrigger on Project_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectStageHandler.handleAfterDelete(Trigger.old);
    }
}
