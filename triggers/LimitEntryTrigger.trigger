trigger LimitEntryTrigger on Limit_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitEntryHandler.handleAfterDelete(Trigger.old);
    }
}
