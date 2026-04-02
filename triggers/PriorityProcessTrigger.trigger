trigger PriorityProcessTrigger on Priority_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityProcessHandler.handleAfterDelete(Trigger.old);
    }
}
