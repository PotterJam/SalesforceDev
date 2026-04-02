trigger SupportPolicyTrigger on Support_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
