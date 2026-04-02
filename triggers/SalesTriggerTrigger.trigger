trigger SalesTriggerTrigger on Sales_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
