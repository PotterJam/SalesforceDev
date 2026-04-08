trigger StatusProcessTrigger on Status_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusProcessHandler.handleAfterDelete(Trigger.old);
    }
}
