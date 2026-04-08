trigger SalesActionTrigger on Sales_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesActionHandler.handleAfterDelete(Trigger.old);
    }
}
