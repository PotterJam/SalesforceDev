trigger RangeFilterTrigger on Range_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeFilterHandler.handleAfterDelete(Trigger.old);
    }
}
