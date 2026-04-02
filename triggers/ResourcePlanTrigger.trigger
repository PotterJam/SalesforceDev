trigger ResourcePlanTrigger on Resource_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourcePlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourcePlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourcePlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourcePlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourcePlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourcePlanHandler.handleAfterDelete(Trigger.old);
    }
}
