trigger ResearchServiceTrigger on Research_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchServiceHandler.handleAfterDelete(Trigger.old);
    }
}
