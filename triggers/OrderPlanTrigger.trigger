trigger OrderPlanTrigger on Order_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderPlanHandler.handleAfterDelete(Trigger.old);
    }
}
