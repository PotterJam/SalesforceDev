trigger StatusTriggerTrigger on Status_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
