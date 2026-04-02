trigger VarianceTriggerTrigger on Variance_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
