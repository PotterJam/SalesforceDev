trigger PhaseModuleTrigger on Phase_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseModuleHandler.handleAfterDelete(Trigger.old);
    }
}
