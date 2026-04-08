trigger LabelPlanTrigger on Label_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelPlanHandler.handleAfterDelete(Trigger.old);
    }
}
