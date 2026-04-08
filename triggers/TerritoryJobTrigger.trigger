trigger TerritoryJobTrigger on Territory_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryJobHandler.handleAfterDelete(Trigger.old);
    }
}
