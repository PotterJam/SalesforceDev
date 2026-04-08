trigger LevelEntryTrigger on Level_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelEntryHandler.handleAfterDelete(Trigger.old);
    }
}
