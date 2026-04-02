trigger ReviewProcessTrigger on Review_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewProcessHandler.handleAfterDelete(Trigger.old);
    }
}
