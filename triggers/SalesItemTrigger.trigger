trigger SalesItemTrigger on Sales_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesItemHandler.handleAfterDelete(Trigger.old);
    }
}
