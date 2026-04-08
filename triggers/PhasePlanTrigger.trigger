trigger PhasePlanTrigger on Phase_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhasePlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhasePlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhasePlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhasePlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhasePlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhasePlanHandler.handleAfterDelete(Trigger.old);
    }
}
