trigger ResearchTaskTrigger on Research_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTaskHandler.handleAfterDelete(Trigger.old);
    }
}
