trigger FloorHandlerTrigger on Floor_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
