trigger LeadLogTrigger on Lead_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadLogHandler.handleAfterDelete(Trigger.old);
    }
}
