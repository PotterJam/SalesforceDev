trigger ReviewModuleTrigger on Review_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewModuleHandler.handleAfterDelete(Trigger.old);
    }
}
