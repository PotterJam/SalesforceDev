trigger LeadPolicyTrigger on Lead_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
