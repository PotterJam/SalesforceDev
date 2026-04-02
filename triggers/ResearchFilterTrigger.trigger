trigger ResearchFilterTrigger on Research_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchFilterHandler.handleAfterDelete(Trigger.old);
    }
}
