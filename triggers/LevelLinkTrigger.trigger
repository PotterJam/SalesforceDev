trigger LevelLinkTrigger on Level_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelLinkHandler.handleAfterDelete(Trigger.old);
    }
}
