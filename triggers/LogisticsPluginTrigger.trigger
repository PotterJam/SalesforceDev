trigger LogisticsPluginTrigger on Logistics_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsPluginHandler.handleAfterDelete(Trigger.old);
    }
}
