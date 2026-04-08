trigger ResourceStageTrigger on Resource_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceStageHandler.handleAfterDelete(Trigger.old);
    }
}
