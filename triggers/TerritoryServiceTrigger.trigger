trigger TerritoryServiceTrigger on Territory_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryServiceHandler.handleAfterDelete(Trigger.old);
    }
}
