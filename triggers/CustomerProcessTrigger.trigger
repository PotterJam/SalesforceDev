trigger CustomerProcessTrigger on Customer_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerProcessHandler.handleAfterDelete(Trigger.old);
    }
}
