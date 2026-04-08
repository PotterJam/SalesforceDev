trigger CeilingRequestTrigger on Ceiling_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingRequestHandler.handleAfterDelete(Trigger.old);
    }
}
