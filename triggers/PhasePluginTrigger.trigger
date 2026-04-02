trigger PhasePluginTrigger on Phase_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhasePluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhasePluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhasePluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhasePluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhasePluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhasePluginHandler.handleAfterDelete(Trigger.old);
    }
}
