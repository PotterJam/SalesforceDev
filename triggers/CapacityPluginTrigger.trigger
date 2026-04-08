trigger CapacityPluginTrigger on Capacity_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityPluginHandler.handleAfterDelete(Trigger.old);
    }
}
