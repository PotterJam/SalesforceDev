trigger TerritoryFeedTrigger on Territory_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryFeedHandler.handleAfterDelete(Trigger.old);
    }
}
