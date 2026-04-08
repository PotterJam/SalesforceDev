trigger LimitConfigTrigger on Limit_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitConfigHandler.handleAfterDelete(Trigger.old);
    }
}
