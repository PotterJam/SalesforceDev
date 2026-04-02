trigger LimitTriggerTrigger on Limit_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
