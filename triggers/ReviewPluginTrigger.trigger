trigger ReviewPluginTrigger on Review_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewPluginHandler.handleAfterDelete(Trigger.old);
    }
}
