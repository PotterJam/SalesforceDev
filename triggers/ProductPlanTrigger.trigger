trigger ProductPlanTrigger on Product_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductPlanHandler.handleAfterDelete(Trigger.old);
    }
}
