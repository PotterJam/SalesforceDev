trigger LevelRegistryTrigger on Level_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
