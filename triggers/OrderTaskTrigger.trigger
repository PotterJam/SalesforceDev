trigger OrderTaskTrigger on Order_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderTaskHandler.handleAfterDelete(Trigger.old);
    }
}
