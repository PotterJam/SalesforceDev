trigger LimitItemTrigger on Limit_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitItemHandler.handleAfterDelete(Trigger.old);
    }
}
