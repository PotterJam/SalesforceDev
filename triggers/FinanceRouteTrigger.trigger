trigger FinanceRouteTrigger on Finance_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceRouteHandler.handleAfterDelete(Trigger.old);
    }
}
