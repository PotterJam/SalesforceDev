trigger DurationPlanTrigger on Duration_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationPlanHandler.handleAfterDelete(Trigger.old);
    }
}
