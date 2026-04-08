trigger LeadEntryTrigger on Lead_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadEntryHandler.handleAfterDelete(Trigger.old);
    }
}
