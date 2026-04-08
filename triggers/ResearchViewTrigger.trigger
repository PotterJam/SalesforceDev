trigger ResearchViewTrigger on Research_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchViewHandler.handleAfterDelete(Trigger.old);
    }
}
