trigger ResolutionDeltaTrigger on Resolution_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
