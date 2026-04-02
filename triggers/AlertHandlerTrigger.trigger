trigger AlertHandlerTrigger on Alert_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
