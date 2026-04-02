trigger TerritoryMappingTrigger on Territory_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryMappingHandler.handleAfterDelete(Trigger.old);
    }
}
