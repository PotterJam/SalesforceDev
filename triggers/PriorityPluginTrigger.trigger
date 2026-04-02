trigger PriorityPluginTrigger on Priority_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityPluginHandler.handleAfterDelete(Trigger.old);
    }
}
