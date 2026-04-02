trigger LeadQueueTrigger on Lead_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadQueueHandler.handleAfterDelete(Trigger.old);
    }
}
