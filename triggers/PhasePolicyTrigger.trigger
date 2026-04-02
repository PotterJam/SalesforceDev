trigger PhasePolicyTrigger on Phase_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhasePolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhasePolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhasePolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhasePolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhasePolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhasePolicyHandler.handleAfterDelete(Trigger.old);
    }
}
