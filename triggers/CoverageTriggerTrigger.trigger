trigger CoverageTriggerTrigger on Coverage_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
