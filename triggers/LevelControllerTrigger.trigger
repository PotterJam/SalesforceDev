trigger LevelControllerTrigger on Level_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelControllerHandler.handleAfterDelete(Trigger.old);
    }
}
