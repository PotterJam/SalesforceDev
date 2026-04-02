trigger RatioHandlerTrigger on Ratio_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
