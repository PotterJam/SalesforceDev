trigger CapacityModuleTrigger on Capacity_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityModuleHandler.handleAfterDelete(Trigger.old);
    }
}
