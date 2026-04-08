trigger ResolutionEventTrigger on Resolution_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionEventHandler.handleAfterDelete(Trigger.old);
    }
}
