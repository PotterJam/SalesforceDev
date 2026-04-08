trigger LevelAdapterTrigger on Level_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
