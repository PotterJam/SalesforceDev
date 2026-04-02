trigger CustomerTaskTrigger on Customer_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerTaskHandler.handleAfterDelete(Trigger.old);
    }
}
