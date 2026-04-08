trigger SupportPlanTrigger on Support_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportPlanHandler.handleAfterDelete(Trigger.old);
    }
}
