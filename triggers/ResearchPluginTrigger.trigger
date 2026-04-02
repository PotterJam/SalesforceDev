trigger ResearchPluginTrigger on Research_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchPluginHandler.handleAfterDelete(Trigger.old);
    }
}
