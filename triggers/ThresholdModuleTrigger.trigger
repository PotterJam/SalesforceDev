trigger ThresholdModuleTrigger on Threshold_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdModuleHandler.handleAfterDelete(Trigger.old);
    }
}
