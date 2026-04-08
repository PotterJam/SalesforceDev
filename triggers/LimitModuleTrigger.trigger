trigger LimitModuleTrigger on Limit_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitModuleHandler.handleAfterDelete(Trigger.old);
    }
}
