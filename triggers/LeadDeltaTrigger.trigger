trigger LeadDeltaTrigger on Lead_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
