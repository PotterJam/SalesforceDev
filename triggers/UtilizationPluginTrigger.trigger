trigger UtilizationPluginTrigger on Utilization_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationPluginHandler.handleAfterDelete(Trigger.old);
    }
}
