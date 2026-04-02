trigger TagStageTrigger on Tag_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagStageHandler.handleAfterDelete(Trigger.old);
    }
}
