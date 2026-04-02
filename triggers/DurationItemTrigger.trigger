trigger DurationItemTrigger on Duration_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationItemHandler.handleAfterDelete(Trigger.old);
    }
}
