trigger ResearchItemTrigger on Research_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchItemHandler.handleAfterDelete(Trigger.old);
    }
}
