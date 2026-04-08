trigger VariancePluginTrigger on Variance_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VariancePluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VariancePluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VariancePluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VariancePluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VariancePluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VariancePluginHandler.handleAfterDelete(Trigger.old);
    }
}
