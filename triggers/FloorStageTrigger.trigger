trigger FloorStageTrigger on Floor_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorStageHandler.handleAfterDelete(Trigger.old);
    }
}
