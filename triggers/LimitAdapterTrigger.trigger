trigger LimitAdapterTrigger on Limit_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
