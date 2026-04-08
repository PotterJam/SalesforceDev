trigger ScorePlanTrigger on Score_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScorePlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScorePlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScorePlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScorePlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScorePlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScorePlanHandler.handleAfterDelete(Trigger.old);
    }
}
