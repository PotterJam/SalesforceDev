trigger TerritoryRequestTrigger on Territory_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryRequestHandler.handleAfterDelete(Trigger.old);
    }
}
