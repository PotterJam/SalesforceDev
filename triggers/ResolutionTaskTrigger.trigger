trigger ResolutionTaskTrigger on Resolution_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionTaskHandler.handleAfterDelete(Trigger.old);
    }
}
