trigger ProjectPlanTrigger on Project_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectPlanHandler.handleAfterDelete(Trigger.old);
    }
}
