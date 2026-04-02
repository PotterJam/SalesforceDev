trigger LimitEventTrigger on Limit_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitEventHandler.handleAfterDelete(Trigger.old);
    }
}
