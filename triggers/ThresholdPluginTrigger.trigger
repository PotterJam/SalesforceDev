trigger ThresholdPluginTrigger on Threshold_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdPluginHandler.handleAfterDelete(Trigger.old);
    }
}
