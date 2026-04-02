trigger ResearchDetailTrigger on Research_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchDetailHandler.handleAfterDelete(Trigger.old);
    }
}
