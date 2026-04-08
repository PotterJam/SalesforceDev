trigger LeadHandlerTrigger on Lead_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
