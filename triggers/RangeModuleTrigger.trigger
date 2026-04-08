trigger RangeModuleTrigger on Range_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeModuleHandler.handleAfterDelete(Trigger.old);
    }
}
