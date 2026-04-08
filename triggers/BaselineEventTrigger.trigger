trigger BaselineEventTrigger on Baseline_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineEventHandler.handleAfterDelete(Trigger.old);
    }
}
