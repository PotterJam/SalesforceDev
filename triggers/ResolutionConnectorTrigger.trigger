trigger ResolutionConnectorTrigger on Resolution_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
