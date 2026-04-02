trigger LeadRequestTrigger on Lead_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadRequestHandler.handleAfterDelete(Trigger.old);
    }
}
