trigger RatioPluginTrigger on Ratio_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioPluginHandler.handleAfterDelete(Trigger.old);
    }
}
