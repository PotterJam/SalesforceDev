trigger VarianceEventTrigger on Variance_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceEventHandler.handleAfterDelete(Trigger.old);
    }
}
