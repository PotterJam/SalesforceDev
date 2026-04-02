trigger TerritoryTaskTrigger on Territory_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryTaskHandler.handleAfterDelete(Trigger.old);
    }
}
