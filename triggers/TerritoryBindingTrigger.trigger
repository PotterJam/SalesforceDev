trigger TerritoryBindingTrigger on Territory_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryBindingHandler.handleAfterDelete(Trigger.old);
    }
}
