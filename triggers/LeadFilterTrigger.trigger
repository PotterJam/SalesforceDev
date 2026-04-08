trigger LeadFilterTrigger on Lead_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadFilterHandler.handleAfterDelete(Trigger.old);
    }
}
