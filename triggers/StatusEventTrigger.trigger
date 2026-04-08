trigger StatusEventTrigger on Status_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusEventHandler.handleAfterDelete(Trigger.old);
    }
}
