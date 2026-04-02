trigger PriorityModuleTrigger on Priority_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityModuleHandler.handleAfterDelete(Trigger.old);
    }
}
