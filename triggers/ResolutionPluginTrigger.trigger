trigger ResolutionPluginTrigger on Resolution_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionPluginHandler.handleAfterDelete(Trigger.old);
    }
}
