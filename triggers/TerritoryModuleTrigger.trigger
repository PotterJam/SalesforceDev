trigger TerritoryModuleTrigger on Territory_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryModuleHandler.handleAfterDelete(Trigger.old);
    }
}
