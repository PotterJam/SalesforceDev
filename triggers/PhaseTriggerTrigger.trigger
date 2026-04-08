trigger PhaseTriggerTrigger on Phase_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
