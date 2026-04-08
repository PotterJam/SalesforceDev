trigger TerritoryControllerTrigger on Territory_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryControllerHandler.handleAfterDelete(Trigger.old);
    }
}
