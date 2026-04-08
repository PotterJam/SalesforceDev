trigger AlertPlanTrigger on Alert_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertPlanHandler.handleAfterDelete(Trigger.old);
    }
}
