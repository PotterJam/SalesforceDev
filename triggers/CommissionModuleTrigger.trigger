trigger CommissionModuleTrigger on Commission_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionModuleHandler.handleAfterDelete(Trigger.old);
    }
}
