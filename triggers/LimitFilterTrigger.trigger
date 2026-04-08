trigger LimitFilterTrigger on Limit_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitFilterHandler.handleAfterDelete(Trigger.old);
    }
}
