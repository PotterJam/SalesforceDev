trigger MarketingPlanTrigger on Marketing_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingPlanHandler.handleAfterDelete(Trigger.old);
    }
}
