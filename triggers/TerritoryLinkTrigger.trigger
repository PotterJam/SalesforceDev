trigger TerritoryLinkTrigger on Territory_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryLinkHandler.handleAfterDelete(Trigger.old);
    }
}
