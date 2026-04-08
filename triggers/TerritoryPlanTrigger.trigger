trigger TerritoryPlanTrigger on Territory_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryPlanHandler.handleAfterDelete(Trigger.old);
    }
}
