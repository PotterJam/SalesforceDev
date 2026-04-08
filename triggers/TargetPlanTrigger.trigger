trigger TargetPlanTrigger on Target_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetPlanHandler.handleAfterDelete(Trigger.old);
    }
}
