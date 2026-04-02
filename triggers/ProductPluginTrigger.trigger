trigger ProductPluginTrigger on Product_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductPluginHandler.handleAfterDelete(Trigger.old);
    }
}
