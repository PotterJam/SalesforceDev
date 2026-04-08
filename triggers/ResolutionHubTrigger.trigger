trigger ResolutionHubTrigger on Resolution_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionHubHandler.handleAfterDelete(Trigger.old);
    }
}
