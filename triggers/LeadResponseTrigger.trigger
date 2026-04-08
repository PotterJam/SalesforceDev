trigger LeadResponseTrigger on Lead_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadResponseHandler.handleAfterDelete(Trigger.old);
    }
}
