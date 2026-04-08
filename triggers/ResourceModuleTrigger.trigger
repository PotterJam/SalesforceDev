trigger ResourceModuleTrigger on Resource_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceModuleHandler.handleAfterDelete(Trigger.old);
    }
}
