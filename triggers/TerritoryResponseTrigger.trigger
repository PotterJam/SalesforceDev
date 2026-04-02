trigger TerritoryResponseTrigger on Territory_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryResponseHandler.handleAfterDelete(Trigger.old);
    }
}
