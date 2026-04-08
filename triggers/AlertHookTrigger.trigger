trigger AlertHookTrigger on Alert_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertHookHandler.handleAfterDelete(Trigger.old);
    }
}
