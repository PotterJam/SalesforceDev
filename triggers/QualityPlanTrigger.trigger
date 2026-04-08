trigger QualityPlanTrigger on Quality_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityPlanHandler.handleAfterDelete(Trigger.old);
    }
}
