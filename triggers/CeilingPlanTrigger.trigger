trigger CeilingPlanTrigger on Ceiling_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingPlanHandler.handleAfterDelete(Trigger.old);
    }
}
