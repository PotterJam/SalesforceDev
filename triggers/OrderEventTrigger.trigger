trigger OrderEventTrigger on Order_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderEventHandler.handleAfterDelete(Trigger.old);
    }
}
