trigger ResearchPlanTrigger on Research_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchPlanHandler.handleAfterDelete(Trigger.old);
    }
}
