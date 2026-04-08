trigger PartnerPolicyTrigger on Partner_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
