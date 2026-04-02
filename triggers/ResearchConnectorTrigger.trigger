trigger ResearchConnectorTrigger on Research_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
