trigger CustomerRequestTrigger on Customer_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRequestHandler.handleAfterDelete(Trigger.old);
    }
}
