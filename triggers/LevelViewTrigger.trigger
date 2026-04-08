trigger LevelViewTrigger on Level_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelViewHandler.handleAfterDelete(Trigger.old);
    }
}
