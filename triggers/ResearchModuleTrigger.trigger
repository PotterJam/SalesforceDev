trigger ResearchModuleTrigger on Research_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchModuleHandler.handleAfterDelete(Trigger.old);
    }
}
