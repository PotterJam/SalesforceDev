trigger LeadLinkTrigger on Lead_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadLinkHandler.handleAfterDelete(Trigger.old);
    }
}
