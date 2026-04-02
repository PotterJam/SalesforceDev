trigger CeilingModuleTrigger on Ceiling_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingModuleHandler.handleAfterDelete(Trigger.old);
    }
}
