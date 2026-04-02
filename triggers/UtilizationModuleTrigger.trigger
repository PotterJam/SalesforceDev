trigger UtilizationModuleTrigger on Utilization_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationModuleHandler.handleAfterDelete(Trigger.old);
    }
}
