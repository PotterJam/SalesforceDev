trigger SupportRequestTrigger on Support_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportRequestHandler.handleAfterDelete(Trigger.old);
    }
}
