trigger TerritoryDetailTrigger on Territory_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryDetailHandler.handleAfterDelete(Trigger.old);
    }
}
