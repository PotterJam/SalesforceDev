trigger RatingModuleTrigger on Rating_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingModuleHandler.handleAfterDelete(Trigger.old);
    }
}
