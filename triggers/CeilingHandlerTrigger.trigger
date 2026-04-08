trigger CeilingHandlerTrigger on Ceiling_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
