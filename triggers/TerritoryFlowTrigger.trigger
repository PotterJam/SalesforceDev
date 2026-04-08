trigger TerritoryFlowTrigger on Territory_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryFlowHandler.handleAfterDelete(Trigger.old);
    }
}
