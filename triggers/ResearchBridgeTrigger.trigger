trigger ResearchBridgeTrigger on Research_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
