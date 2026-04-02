trigger LevelTaskTrigger on Level_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelTaskHandler.handleAfterDelete(Trigger.old);
    }
}
