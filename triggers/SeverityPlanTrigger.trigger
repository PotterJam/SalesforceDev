trigger SeverityPlanTrigger on Severity_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityPlanHandler.handleAfterDelete(Trigger.old);
    }
}
