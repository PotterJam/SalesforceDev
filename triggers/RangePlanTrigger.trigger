trigger RangePlanTrigger on Range_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangePlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangePlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangePlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangePlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangePlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangePlanHandler.handleAfterDelete(Trigger.old);
    }
}
