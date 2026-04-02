trigger CustomerPluginTrigger on Customer_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerPluginHandler.handleAfterDelete(Trigger.old);
    }
}
