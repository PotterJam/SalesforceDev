trigger PartnerPlanTrigger on Partner_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerPlanHandler.handleAfterDelete(Trigger.old);
    }
}
