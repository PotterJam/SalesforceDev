trigger SalesRequestTrigger on Sales_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRequestHandler.handleAfterDelete(Trigger.old);
    }
}
