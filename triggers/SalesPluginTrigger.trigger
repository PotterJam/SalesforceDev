trigger SalesPluginTrigger on Sales_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesPluginHandler.handleAfterDelete(Trigger.old);
    }
}
