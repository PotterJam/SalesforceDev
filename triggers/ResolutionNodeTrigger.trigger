trigger ResolutionNodeTrigger on Resolution_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionNodeHandler.handleAfterDelete(Trigger.old);
    }
}
