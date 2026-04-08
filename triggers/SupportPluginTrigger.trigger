trigger SupportPluginTrigger on Support_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportPluginHandler.handleAfterDelete(Trigger.old);
    }
}
