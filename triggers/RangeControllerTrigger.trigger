trigger RangeControllerTrigger on Range_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeControllerHandler.handleAfterDelete(Trigger.old);
    }
}
