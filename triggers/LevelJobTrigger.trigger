trigger LevelJobTrigger on Level_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelJobHandler.handleAfterDelete(Trigger.old);
    }
}
