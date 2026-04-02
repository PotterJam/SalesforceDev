trigger PartnerHookTrigger on Partner_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerHookHandler.handleAfterDelete(Trigger.old);
    }
}
