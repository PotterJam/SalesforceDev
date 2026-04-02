trigger LeadHubTrigger on Lead_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadHubHandler.handleAfterDelete(Trigger.old);
    }
}
