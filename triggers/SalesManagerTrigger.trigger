trigger SalesManagerTrigger on Sales_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesManagerHandler.handleAfterDelete(Trigger.old);
    }
}
