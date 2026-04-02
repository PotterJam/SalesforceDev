trigger RangeTaskTrigger on Range_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeTaskHandler.handleAfterDelete(Trigger.old);
    }
}
