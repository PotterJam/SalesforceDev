trigger TagModuleTrigger on Tag_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagModuleHandler.handleAfterDelete(Trigger.old);
    }
}
