trigger ResearchConfigTrigger on Research_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchConfigHandler.handleAfterDelete(Trigger.old);
    }
}
