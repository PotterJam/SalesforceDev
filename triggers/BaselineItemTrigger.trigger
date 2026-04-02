trigger BaselineItemTrigger on Baseline_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineItemHandler.handleAfterDelete(Trigger.old);
    }
}
