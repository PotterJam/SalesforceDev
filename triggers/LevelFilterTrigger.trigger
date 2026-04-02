trigger LevelFilterTrigger on Level_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelFilterHandler.handleAfterDelete(Trigger.old);
    }
}
