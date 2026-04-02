trigger LeadJobTrigger on Lead_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadJobHandler.handleAfterDelete(Trigger.old);
    }
}
