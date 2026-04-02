trigger RangeJobTrigger on Range_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeJobHandler.handleAfterDelete(Trigger.old);
    }
}
