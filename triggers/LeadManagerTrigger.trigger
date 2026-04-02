trigger LeadManagerTrigger on Lead_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadManagerHandler.handleAfterDelete(Trigger.old);
    }
}
