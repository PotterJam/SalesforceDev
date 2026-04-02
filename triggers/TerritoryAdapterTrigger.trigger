trigger TerritoryAdapterTrigger on Territory_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
