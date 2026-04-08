trigger LogisticsModuleTrigger on Logistics_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsModuleHandler.handleAfterDelete(Trigger.old);
    }
}
