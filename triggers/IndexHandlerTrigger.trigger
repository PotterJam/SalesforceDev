trigger IndexHandlerTrigger on Index_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
