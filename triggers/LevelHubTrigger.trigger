trigger LevelHubTrigger on Level_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelHubHandler.handleAfterDelete(Trigger.old);
    }
}
