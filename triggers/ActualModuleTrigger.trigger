trigger ActualModuleTrigger on Actual_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualModuleHandler.handleAfterDelete(Trigger.old);
    }
}
