trigger ResolutionProcessTrigger on Resolution_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionProcessHandler.handleAfterDelete(Trigger.old);
    }
}
