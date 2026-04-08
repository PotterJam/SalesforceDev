trigger IssueTriggerTrigger on Issue_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
