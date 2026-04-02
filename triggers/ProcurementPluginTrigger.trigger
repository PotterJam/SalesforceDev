trigger ProcurementPluginTrigger on Procurement_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementPluginHandler.handleAfterDelete(Trigger.old);
    }
}
