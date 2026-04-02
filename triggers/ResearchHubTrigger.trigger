trigger ResearchHubTrigger on Research_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchHubHandler.handleAfterDelete(Trigger.old);
    }
}
