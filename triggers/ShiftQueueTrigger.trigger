trigger ShiftQueueTrigger on Shift_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftQueueHandler.handleAfterDelete(Trigger.old);
    }
}
