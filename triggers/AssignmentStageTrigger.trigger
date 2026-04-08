trigger AssignmentStageTrigger on Assignment_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentStageHandler.handleAfterDelete(Trigger.old);
    }
}
