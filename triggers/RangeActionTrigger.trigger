trigger RangeActionTrigger on Range_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeActionHandler.handleAfterDelete(Trigger.old);
    }
}
