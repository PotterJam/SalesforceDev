trigger ProjectHookTrigger on Project_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectHookHandler.handleAfterDelete(Trigger.old);
    }
}
