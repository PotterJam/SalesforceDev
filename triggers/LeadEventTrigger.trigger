trigger LeadEventTrigger on Lead_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadEventHandler.handleAfterDelete(Trigger.old);
    }
}
