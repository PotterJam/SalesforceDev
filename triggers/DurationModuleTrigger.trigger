trigger DurationModuleTrigger on Duration_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationModuleHandler.handleAfterDelete(Trigger.old);
    }
}
