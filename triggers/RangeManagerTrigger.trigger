trigger RangeManagerTrigger on Range_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeManagerHandler.handleAfterDelete(Trigger.old);
    }
}
