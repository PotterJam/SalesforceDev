trigger ImpactPlanTrigger on Impact_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactPlanHandler.handleAfterDelete(Trigger.old);
    }
}
