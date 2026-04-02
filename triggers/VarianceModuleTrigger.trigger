trigger VarianceModuleTrigger on Variance_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceModuleHandler.handleAfterDelete(Trigger.old);
    }
}
