trigger TagTaskTrigger on Tag_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTaskHandler.handleAfterDelete(Trigger.old);
    }
}
