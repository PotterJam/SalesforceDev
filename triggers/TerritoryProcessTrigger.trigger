trigger TerritoryProcessTrigger on Territory_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryProcessHandler.handleAfterDelete(Trigger.old);
    }
}
