trigger ReviewPlanTrigger on Review_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewPlanHandler.handleAfterDelete(Trigger.old);
    }
}
