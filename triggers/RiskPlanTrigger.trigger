trigger RiskPlanTrigger on Risk_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskPlanHandler.handleAfterDelete(Trigger.old);
    }
}
